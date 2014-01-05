/**
 * Created by boebu on 12/16/13.
 * This represents the shopping cart
 */

function addToCart(itemid) {
    if($.cookie("shopping-cart") === null) {
        $.cookie("shopping-cart", itemid);
    } else {
        cookie = $.cookie("shopping-cart");
        items = cookie.split(",");
        items.push(itemid);
        $.cookie("shopping-cart",items.join(","));
    }
    displayCart();
}

function clearCart() {
    $.cookie("shopping-cart", null);
    displayCart();
}

function displayCart() {
    if($.cookie("shopping-cart") === null) {
        $("#shoppingcart").html("<p>Cart is Empty</p>");
    } else {
        $.get("/items/cartlist", {itemids: $.cookie("shopping-cart").split(",")},function(data) {
            $("#shoppingcart").html(data);
        });
    }

}

// init chart on page load
$(function() {
    displayCart();
});

