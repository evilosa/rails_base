$(document).ready(function() {
    $('a.edit_station').click(function (e) {
        e.preventDefault();

        var station_id = $(this).data('stationId');
        var form;
        var title

        console.log(station_id);

        form = $('#edit_railway_station_' + station_id);
        title = $('#railway_station_title_' + station_id);

        if (!$(this).hasClass('cancel')) {
            $(this).html('Отменить');
            $(this).addClass('cancel');
        } else {
            $(this).html('Редактировать');
            $(this).removeClass('cancel');
        }

        form.toggle();
        title.toggle();
    });
});