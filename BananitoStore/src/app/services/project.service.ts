import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ProjectService {

  constructor(private readonly http: HttpClient) { }

  private UrlAPI = 'https://localhost:44309/'

  private API_ProductosOfertas = this.UrlAPI +'api/productos/listarProductosOfertas';
  private API_ProductosDescatados = this.UrlAPI + 'api/productos/listarProductosDestacados';
  private API_ProductosMarcas = this.UrlAPI + 'api/productos/listarProductosMarcas';


  __listarProductosDestacados_json()
  {
      return this.http.get(this.API_ProductosDescatados)
  }


  __listarProductosOfertas_json()
  {
      return this.http.get(this.API_ProductosOfertas)
  }


  __listarProductosMarcas_json(idMarca: number)
  {

      const url = this.API_ProductosMarcas + '?idMarca=' + idMarca.toString();
      return this.http.get(url)
  }

}
