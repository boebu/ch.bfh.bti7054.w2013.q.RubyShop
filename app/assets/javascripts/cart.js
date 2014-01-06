/**
 * Created by boebu on 12/16/13.
 * This represents the shopping cart
 */

function addToCart(itemid) {
    if ($.cookie("shopping-cart") === null) {
        $.cookie("shopping-cart", itemid);
    } else {
        cookie = $.cookie("shopping-cart");
        items = cookie.split(",");
        items.push(itemid);
        $.cookie("shopping-cart", items.join(","));
    }
    displayCart();
}

function clearCart() {
    $.cookie("shopping-cart", null);
    displayCart();
}

function displayCart() {
    var items = $.cookie("shopping-cart") === null ? [] : $.cookie("shopping-cart").split(",");
    $.get("/items/cartlist", {itemids: items}, function (data) {
        $("#shoppingcart").html(data);
    });

}

// init chart on page load
$(function () {
    displayCart();
});

// check if cart is empty on order now
$('#ordernow').click(function (event) {
    if($.cookie("shopping-cart") === null) {
        event.preventDefault(); // Prevent link from following its href
    }
});

