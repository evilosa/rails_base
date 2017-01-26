update_wagon_seats_fields = function () {
    $('.wagon-seats').hide();

    var selected_value = $('#wagon_type').val();

    if (selected_value == 'CompartmentCarriage' || selected_value == 'OpenPlanCarriage') {
        $('#wagon_group_top_seats').show();
    }

    if (selected_value == 'CompartmentCarriage' || selected_value == 'OpenPlanCarriage' || selected_value == 'UpholsteredCarriage') {
        $('#wagon_group_bottom_seats').show();
    }

    if (selected_value == 'OpenPlanCarriage') {
        $('#wagon_group_side_top_seats').show();
        $('#wagon_group_side_bottom_seats').show();
    }

    if (selected_value == 'CoachCarriage') {
        $('#wagon_group_seats').show();
    }

    // Обнуляем скрытые поля, для случая смены типа вагона с уже указанными значениями
    $('.wagon-seats:hidden input').val(0)
};

document.addEventListener("turbolinks:load", function() {
    update_wagon_seats_fields();

    $('#wagon_type').change(function () {
        update_wagon_seats_fields();
    });
});