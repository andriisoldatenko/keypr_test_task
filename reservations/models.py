from django.db import models
from django.utils.translation import ugettext_lazy as _


class Reservation(models.Model):
    first_name = models.CharField(_('first name'), max_length=30)
    last_name = models.CharField(_('last name'), max_length=30)
    room_number = models.CharField(max_length=50)
    start_date = models.DateField(auto_now=True, db_index=True)
    end_date = models.DateField(auto_now=True, db_index=True)

    def __str__(self):
        return '{} {} reservation of room number {}'.format(
            self.first_name, self.last_name, self.room_number
        )

    class Meta:
        db_table = 'reservations'
