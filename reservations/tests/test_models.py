import pytest
from model_mommy import mommy

from reservations.models import Reservation


@pytest.mark.django_db
def test_create_simple_reservation():
    reservation = mommy.make(
        Reservation, first_name='Andrii', last_name='Soldatenko',
        room_number='1')
    assert str(reservation) == 'Andrii Soldatenko reservation of room number 1'
