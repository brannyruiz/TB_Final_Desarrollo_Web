import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  items: any[] = [];
  item: any;
  constructor() { }

  agregarAlCarrito(producto: any) {

    this.items = this.getArray('items');
    const index = this.items.findIndex(item => item.id_articulo == producto.id_articulo  && item.cantidad == producto.cantidad);

    if (index != -1) {
      this.items[index].cantidad++;
    }else{
      this.items.push(producto);
      this.setArray('items', producto);

    }

  }

quitarAlCarrito(producto: any){

  this.items = this.getArray('items');
  this.items = this.items.filter(item => item.id_articulo != producto.id_articulo  && item.cantidad == producto.cantidad);

  console.log(producto.id_articulo);
  this.setArray('items', this.items);

}


  vaciarCarrito() {
    sessionStorage.removeItem('items');
    this.items = [];

  }

  obtenerItems() {

    this.items = this.getArray('items');
    return this.items;
  }

  obtenerCantidad() {

    this.items = this.getArray('items');
    return this.items.length;
  }

  guardarArticulo(item: any){
    this.setItem('articulo',item);
  }

  obtenerArticulo(){
    this.item = this.getItem('articulo');
    console.log(this.item);
    return this.item;
  }


  // Método para guardar un arreglo en sessionStorage
  setArray(key: string, array: any[]): void {
    sessionStorage.setItem(key, JSON.stringify(array));
  }

  // Método para obtener un arreglo de sessionStorage
  getArray(key: string): any[] {
    const arrayString = sessionStorage.getItem(key);
    return arrayString ? JSON.parse(arrayString) : [];
  }



 setItem(key: string, item: any): void {
  sessionStorage.setItem(key, JSON.stringify(item));
}


getItem(key: string): any {
  const item = sessionStorage.getItem(key);
  return item ? JSON.parse(item) : [];
}




}
