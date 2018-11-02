"""siftit URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from vehicles import views as vehicleView
from users import views as usersView
from reports import views as reportsView


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^typeV/$', vehicleView.TypeVehicleAPI.as_view()),
    url(r'^typeT/$', vehicleView.TrademarkAPI.as_view()),
    url(r'^typeB/$', vehicleView.TypeBodyworkAPI.as_view()),
    url(r'^vehicle/$', vehicleView.VehicleAPI.as_view()),
    url(r'^updateV/$', vehicleView.UpdateVAPI.as_view()),
    url(r'^typeU/$', usersView.TypeUserAPI.as_view()),
    url(r'^users/$', usersView.UserAPI.as_view()),
    url(r'^reports/$', reportsView.InfoAPI.as_view()),
    url(r'^reportsTm/$', reportsView.VehiclebytmAPI.as_view()),

]
