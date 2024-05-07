import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { ProjectService } from '../../services/project.service';
import { CartService } from '../../services/cart.service';

@Component({
  selector: 'app-marcas',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './marcas.component.html',
  styleUrl: './marcas.component.css'
})
export class MarcasComponent {

  constructor (private ps:ProjectService, private cartService: CartService){}

  projects : any = []

  __ProductosMarcas(idMarca: number){
    this.ps.__listarProductosMarcas_json(idMarca).subscribe((rest:any) => {
      this.projects = rest.data
      console.log(this.projects)
    })
  }

  agregarProductoAlCarrito(producto: any)
  {
    this.cartService.agregarAlCarrito(producto);
  }



}
