$(document).ready(function() {
    $('.search_form').submit(function() {
        var start_station;
        var end_station;

        start_station = $(this).find('#search_first_station_id');
        end_station = $(this).find('#search_last_station_id');

        console.log(end_station);

        if (start_station.val() == end_station.val()) {
            alert('Выберите конечную станцию');
            return false;
        }
    });
});