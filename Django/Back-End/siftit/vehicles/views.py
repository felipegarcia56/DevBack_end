import json
import ast
from rest_framework.response import Response
from rest_framework.views import APIView
from vehicles.models import TypeVehicle, Trademark, TypeBodywork,VehicleLi
from users.models import UsersLi
from django.db import connection as conn
# Create your views here.

class TypeVehicleAPI(APIView):

    def get(self, request):
        try:
            result = []
            data = request.query_params.get('all',None)
            if data is not None:
                data = ast.literal_eval(data)
                if data:
                    types = TypeVehicle.objects.all()
                else:
                    filter_ = request.query_params.get('filter', None)
                    if filter_ is not None and filter_ != "":
                        types = TypeVehicle.objects.filter(description=filter_)
                    else:
                        return Response("all data is required",400)
                for type_ in types:
                    result.append({"id":type_.id,"description":type_.description})

                return Response(result,200)
            else:
                return Response("hi world",200)
        except Exception as e:
            return Response({"error":e},200)

    def post(self, request):
        try:
            json_data = json.loads(request.data['data'])
            new_tv= TypeVehicle(description=json_data['description'])
            new_tv.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

    def put(self, request):
        try:
            json_data = request.data
            update = TypeVehicle(id=json_data['id'])
            update.description = json_data['description']
            update.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)


class TrademarkAPI(APIView):

    def get(self, request):
        try:
            result = []
            data = request.query_params.get('all',None)
            if data is not None:
                data = ast.literal_eval(data)
                if data:
                    types = Trademark.objects.all()
                else:
                    filter_ = request.query_params.get('filter', None)
                    if filter_ is not None and filter_ != "":
                        types = Trademark.objects.filter(description=filter_)
                    else:
                        return Response("all data is required",400)
                for type_ in types:
                    result.append({"id":type_.id,"description":type_.description})

                return Response(result,200)
            else:
                return Response("hi world",200)
        except Exception as e:
            return Response({"error":e},200)

    def post(self, request):
        try:
            json_data = json.loads(request.data['data'])
            new_tm= Trademark(description=json_data['description'])
            new_tm.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

    def put(self, request):
        try:
            json_data = request.data
            update = Trademark(id=json_data['id'])
            update.description = json_data['description']
            update.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

class TypeBodyworkAPI(APIView):

    def get(self, request):
        try:
            result = []
            data = request.query_params.get('all',None)
            if data is not None:
                data = ast.literal_eval(data)
                if data:
                    types = TypeBodywork.objects.all()
                else:
                    filter_ = request.query_params.get('filter', None)
                    if filter_ is not None and filter_ != "":
                        types = TypeBodywork.objects.filter(description=filter_)
                    else:
                        return Response("all data is required",400)
                for type_ in types:
                    result.append({"id":type_.id,"description":type_.description})

                return Response(result,200)
            else:
                return Response("hi world",200)
        except Exception as e:
            return Response({"error":e},200)

    def post(self, request):
        try:
            json_data = json.loads(request.data['data'])
            new_tb= TypeBodywork(description=json_data['description'])
            new_tb.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

    def put(self, request):
        try:
            json_data = request.data
            update = TypeBodywork(id=json_data['id'])
            update.description = json_data['description']
            update.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

class VehicleAPI(APIView):

    def getVehicle(self, column, filter_):
        vehicles = ''
        if column == 'type_v':
            vehicles = VehicleLi.objects.filter(type_vehicle=filter_)
        elif column == 'type_bw':
            vehicles = VehicleLi.objects.filter(type_bodywork=filter_)
        elif column == 'type_tm':
            vehicles = VehicleLi.objects.filter(trademark=filter_)
        elif column == 'user':
            vehicles = VehicleLi.objects.filter(id_user=filter_)
        elif column == 'plate':
            vehicles = VehicleLi.objects.filter(plate=filter_)
        return vehicles

    def get(self, request):
        try:
            result = []
            data = request.query_params.get('all',None)
            if data is not None:
                data = ast.literal_eval(data)
                if data:
                    vehicles_ = VehicleLi.objects.all()
                else:
                    filter_ = request.query_params.get('filter', None)
                    column = request.query_params.get('column', None)
                    if filter_ is not None and filter_ != "":
                        vehicles_ = self.getVehicle(column,filter_)
                    else:
                        return Response("all data is required",400)
                for vehicle_ in vehicles_:
                    result.append({"id":vehicle_.id,"plate":vehicle_.plate,
                                   "type_vehicle":vehicle_.type_vehicle.description,
                                   "type_bodywork": vehicle_.type_bodywork.description,
                                   "trademark": vehicle_.trademark.description,
                                   "user": vehicle_.id_user.last_name+" "+vehicle_.id_user.full_name})

                return Response(result,200)
            else:
                return Response("hi world",200)
        except Exception as e:
            return Response({"error":e},200)

    def post(self, request):
        try:
            json_data = json.loads(request.data['data'])
            newUser = VehicleLi(plate=json_data["plate"],
                                type_vehicle=TypeVehicle(id=json_data['type_vehicle']),
                                type_bodywork=TypeBodywork(id=json_data['type_bw']),
                                trademark=Trademark(id=json_data['type_tm']),
                                id_user= UsersLi(id=json_data['user']))
            newUser.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)


class UpdateVAPI(APIView):
    def get(self,request):
        return Response("ok",200)

    def put(self,request):
        try:
            print("holaaaaaaa")
            print(request.data)
            json_data = json.loads(request.data['data'])
            print(json_data['id'])
            cu = conn.cursor()
            print("UPDATE vehicle_li SET plate='"+json_data['plate']+"', type_vehicle="+json_data['type_vehicle']+", type_bodywork="+json_data['type_bw']+", trademark="+json_data['type_tm']+",id_user="+json_data['user']+" WHERE id = "+json_data['id']+";")
            cu.execute("UPDATE vehicle_li SET plate='"+json_data['plate']+"', type_vehicle="+json_data['type_vehicle']+", type_bodywork="+json_data['type_bw']+", trademark="+json_data['type_tm']+",id_user="+json_data['user']+" WHERE id = "+json_data['id']+";")
            cu.close()

            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},500)
