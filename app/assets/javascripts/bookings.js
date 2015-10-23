function adder()
  {
    counter = 1;
    var label1 = $("<label>").text("Name");
    var textbox1 = $('<input type="text">').attr({class: "validate", name: "name" + (counter + 1)});
    var label2 = $("<label>").text("Email");
    var textbox2 = $('<input type="text">').attr({class: "validate", name: "email" + (counter + 1)});
    var rem = $('<button />').attr({class: "remove_pass btn blue", id: "remove_pass" + (counter + 1), type: "button"});
    rem.text("Remove passenger");
    $(".pass_list").append(label1, textbox1, label2, textbox2, rem);
    calc_total()
  }

  function calc_total()
  {
    init_total =  parseInt($(".total").text().match(/\d+/));
    var total = init_total + parseInt($(".add_more").val());
    $(".cost_tracker").val(total);
    $(".total").text("Total Cost: $" + total);
  }

  function remove_element()
  {
    id  = $(this).attr("id");
    console.log(id)

    // $("#" + id).prevAll().remove();
    // $("#" + id).remove();
  }
