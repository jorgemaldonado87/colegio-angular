import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-seleccionar-colegio',
  templateUrl: './seleccionar-colegio.component.html',
  styleUrls: ['./seleccionar-colegio.component.scss']
})
export class SeleccionarColegioComponent implements OnInit {

  colegios: any = [];
  colegioSeleccionado: any = 'null';

  constructor(
    private apiService: ApiService,
    private router: Router
  ) { }


  ngOnInit(): void {


    console.log();
    this.cargarColegios();
  }

  //cargar colegios del usuario desde la base de datos
  //si el usuario no tiene colegios, redirigir a auth/crear-colegio
  async cargarColegios() {
    try {
      let respuesta: any = await this.apiService.get('usuarios/'+ JSON.parse(localStorage.getItem('usuario') ?? "{}").rut+'/colegios') ;
      if(respuesta.data.length == 0){
        this.router.navigate(['/auth/crear-colegio']);
      }else{
        this.colegios = respuesta.data;
      }

    }
    catch (e) {
      console.log(JSON.stringify(e));
    }
  }

  //metodo para seleccionar colegio, guardarlo en localStorage y redirigir a admin/dashboard
  seleccionarColegio() {
    console.log(this.colegioSeleccionado);

  }

  setColegio() {
    //set selectedColegio to localStorage as string
    localStorage.setItem('colegio', JSON.stringify(this.colegioSeleccionado));
    this.router.navigate(['/admin/dashboard']);
  }





}
