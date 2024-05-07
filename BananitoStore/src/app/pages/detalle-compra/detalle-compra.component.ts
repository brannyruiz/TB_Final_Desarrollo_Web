import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { ProjectService } from '../../services/project.service';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

@Component({
  selector: 'app-detalle-compra',
  standalone: true,
  imports: [CommonModule,FormsModule],
  templateUrl: './detalle-compra.component.html',
  styleUrl: './detalle-compra.component.css'
})
export class DetalleCompraComponent {


  articulo : any;
  talla : number;
  cantidad : number;

  constructor (private ps:ProjectService, private cartService: CartService){

    this.talla = 0;
    this.cantidad = 1;
  }


  ngOnInit() : void
    {

      this.articulo = this.cartService.obtenerArticulo();
      console.log('Inicio:'+ this.articulo);

    }

    agregarProductoAlCarrito(producto: any)
    {
      this.cartService.agregarAlCarrito(producto);
    }

    onOptionChange(event: any) {
      this.talla = event.target.value;
      this.articulo.talla = this.talla;

    }

    onInputChange(event: any) {
      this.cantidad = event.target.value;
      console.log(this.cantidad);
      this.articulo.cantidad = this.cantidad;
    }


}
