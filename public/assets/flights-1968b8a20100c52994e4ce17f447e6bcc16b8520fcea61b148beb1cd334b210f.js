$(document).ready(function(){
        $(".slider").slider({full_width: true, height: "40em"});
        $(".modal-trigger").leanModal();
        $(".add_more").click(adder);
        $(".remove_pass").click(remove_element);
      });

  function adder()
  {
    var label1 = $("<label>").text("Name");
    var textbox1 = $('<input type="text">').attr({name: "name", class: "validate"});
    var label2 = $("<label>").text("Email");
    var textbox2 = $('<input type="text">').attr({name: "email", class: "validate"});
    var rem = $('<button />').attr({class: "remove_pass btn blue", type: "button"});
    rem.text("Remove passenger");
    $(".pass_list").append(label1, textbox1, label2, textbox2, rem);
  }

  function remove_element()
  {
    label = $(this).closest("label");
    textbox = $(this).closest('input');
    label.remove();
    textbox.remove();
    $(this).remove();
  }
