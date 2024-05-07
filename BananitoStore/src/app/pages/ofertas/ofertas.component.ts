import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { CartService } from '../../services/cart.service';
import { ProjectService } from '../../services/project.service';

@Component({
  selector: 'app-ofertas',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './ofertas.component.html',
  styleUrl: './ofertas.component.css'
})
export class OfertasComponent {


  //constructor (private ps:ProjectService, private cartService: CartService){}

  //agregarProductoAlCarrito(producto: any)
  //{
  //    this.cartService.agregarAlCarrito(producto);
  //}

}
