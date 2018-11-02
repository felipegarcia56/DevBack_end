import json
import ast
from rest_framework.response import Response
from rest_framework.views import APIView
from users.models import TypeUser, UsersLi

from django.db import connection as conn
# Create your views here.


class TypeUserAPI(APIView):

    def get(self, request):
        try:
            result = []
            data = request.query_params.get('all',None)
            if data is not None:
                data = ast.literal_eval(data)
                if data:
                    types = TypeUser.objects.all()
                else:
                    filter_ = request.query_params.get('filter', None)
                    if filter_ is not None and filter_ != "":
                        types = TypeUser.objects.filter(description=filter_)
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
            json_data = request.data
            newType = TypeUser(description= json_data['description'])
            newType.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

    def put(self,request):
        try:
            json_data = request.data
            update = TypeUser(id=json_data['id'])
            update.description = json_data['description']
            update.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)


class UserAPI(APIView):

    def get(self, request):
        try:
            result = []
            data = request.query_params.get('all',None)
            if data is not None:
                data = ast.literal_eval(data)
                if data:
                    users_ = UsersLi.objects.all()
                else:
                    filter_ = request.query_params.get('filter', None)
                    if filter_ is not None and filter_ != '':
                        users_ = UsersLi.objects.filter(identification=filter_)
                    else:
                        return Response("all data is required",400)
                for user_ in users_:
                    result.append({"id":user_.id,"last_name":user_.last_name,"full_name":user_.full_name,
                                   "identification":user_.identification,"type_user":user_.type_user.description})

                return Response(result,200)
            else:
                return Response("hi world",200)
        except Exception as e:
            return Response({"error":e},200)

    def post(self, request):
        try:
            json_data = json.loads(request.data['data'])
            newUser = UsersLi(last_name=json_data['last_name'],
                              full_name=json_data['name'],
                              identification=json_data['identification'],
                              type_user=TypeUser(id=json_data['type_user']))
            newUser.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)

    def put(self,request):
        try:
            json_data = request.data
            update = UsersLi(id=json_data['id'])
            update.last_name = json_data['last_name']
            update.full_name = json_data['name']
            update.identification = json_data['identification']
            update.type_user = TypeUser(id=json_data['type_user'])
            update.save()
            return Response("ok",200)
        except Exception as e:
            return Response({"error":e},200)