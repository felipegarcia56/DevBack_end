from rest_framework.response import Response
from rest_framework.views import APIView
from django.db import connection as conn
# Create your views here.


class InfoAPI(APIView):
    def get(self,request):
        try:
            cursor = conn.cursor()
            document = str(request.query_params.get("document",''))
            name = str(request.query_params.get("name",''))
            plate = str(request.query_params.get("plate",''))
            query = "SELECT CONCAT(us.last_name,' ',us.full_name) as _NAME_,us.identification as _DOCUMENT_, " \
                    "v.plate as PLACA_, tv.description as _TIPO_VEHICULO_, " \
                    "bw.description as _TIPO_CARROCERIA, tm.description as _MARCA_" \
                    " FROM users_li as us " \
                    "left join vehicle_li as v on v.id_user = us.id " \
                    "left join type_vehicle as tv on tv.id = v.type_vehicle " \
                    "left join type_bodywork as bw on bw.id = v.type_bodywork " \
                    "left join trademark as tm on tm.id = v.trademark " \
                    "WHERE  CONCAT(us.last_name,' ',us.full_name) like '%"+name+"%' and " \
                    "us.identification like '%"+document+"%' and " \
                    "v.plate like '%"+plate+"%'"
            cursor.execute(query)
            data = cursor.fetchall()
            rta = []
            for row in data:
                rta.append({"user": row[0], "document": row[1], "plate": row[2], "type_v": row[3], "type_bw": row[4], "type_tm": row[5]})
            return Response(rta, 200)
        except Exception as e:
            return Response("error "+e,500)
        finally:
            cursor.close()


class VehiclebytmAPI(APIView):
    def get(self,request):
        try:
            cursor = conn.cursor()
            query = ("select tm.description as _MARCA_, count(v.id) "
                      "FROM trademark as tm "
                      "right join vehicle_li as v on v.trademark = tm.id group by _MARCA_;")
            cursor.execute(query)
            data = cursor.fetchall()
            rta = []
            for row in data:
                rta.append({"trademark": row[0], "count": row[1]})
            return Response(rta, 200)
        except Exception as e:
            return Response("error " + e, 500)
        finally:
            cursor.close()
