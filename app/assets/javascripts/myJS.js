$(document).ready(function () {
    $('#myOfferSubmit').click(function() {
        $('#myOfferForm').submit();
        return false;  // cancel the initial submit event
    }, false);
});