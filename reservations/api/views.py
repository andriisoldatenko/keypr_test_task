from rest_framework.generics import (
    ListCreateAPIView,
    RetrieveUpdateDestroyAPIView
)

from reservations.api.serializers import ReservationSerializer
from reservations.models import Reservation


class ReservationListCreateAPIView(ListCreateAPIView):
    serializer_class = ReservationSerializer
    queryset = Reservation.objects.all()


class ReservationRetrieveUpdateDestroyAPIView(RetrieveUpdateDestroyAPIView):
    serializer_class = ReservationSerializer
    queryset = Reservation.objects.all()
