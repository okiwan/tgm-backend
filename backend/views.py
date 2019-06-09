from django.shortcuts import render
from backend.models import Group
from rest_framework import viewsets
from backend.serializers import GroupSerializer

class GroupViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
