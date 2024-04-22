function filterBrands(className){
    let items = document.getElementsByClassName("shoe-item");
    if (!className){        
        for (let i = 0; i < items.length; i++) {
            items[i].style.display = 'block';
        }
    }
    else{
        for (let i = 0; i < items.length; i++) {
            let item = items[i];

            let classes = items[i].classList;
            let classesArray = Array.from(classes);
            if(classesArray.includes(className)){
                items[i].style.display = 'block';
            }
            else{
                items[i].style.display = 'none';
            }
        }
    }
}