from backend.models import Group
from rest_framework import serializers

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('file_id', 'name', 'fit_flag', 'country')