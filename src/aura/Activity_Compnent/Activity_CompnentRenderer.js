({
	// Your renderer method overrides go here
    afterRender: function (component, helper) {
    this.superAfterRender();
   alert('Hi'+document.getElementsByClassName('header'));
     var html = document.getElementsByClassName('header ');
       alert('html'+ html); 
        alert('length'+ html.length); 
       
       // document.getElementsByClassName('oneHeader.headerLayout')[1].style.display='none';
} 
})