from django.contrib import admin
from backend.models import Group

class GroupAdmin(admin.ModelAdmin):
    list_display = ("name", "start_date", "company_name")
    ordering = ["-start_date"]
    search_fields = ["name" , "company_name"]


admin.site.register(Group, GroupAdmin)