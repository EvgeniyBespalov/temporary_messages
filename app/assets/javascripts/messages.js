function sendMessage() {

  $.ajax({
    type: "POST",
    url: "/messages/create",
    dataType: "json",
    data: {description: document.getElementById("message_description").value},
    success: function(result) {
      var ul = document.getElementById("ul_date");
      var li = document.createElement("li");
      li.innerText = result.date;
      ul.appendChild(li);
      document.getElementById("message_description").value = "";
      document.getElementById("countMessage").innerHTML = result.count;
      document.getElementById("countMessageDescription").innerHTML = result.request_description;
      }
    }  
  );
}