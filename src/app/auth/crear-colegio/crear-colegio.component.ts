import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-crear-colegio',
  templateUrl: './crear-colegio.component.html',
  styleUrls: ['./crear-colegio.component.scss']
})
export class CrearColegioComponent implements OnInit {

  tiposColegios: any[] = [];

  //colegios tiene id, codigo, nombre, direccion, nombre_corto, tipo_colegios_id
  crearColegioForm = new FormGroup({
    codigo: new FormControl(),
    nombre: new FormControl(),
    direccion: new FormControl(),
    nombre_corto: new FormControl(),
    tipos_colegios_id: new FormControl()
  });

  constructor(
    private api: ApiService,
    private router: Router
  ) { }



  ngOnInit(): void {
    this.cargarTiposColegios();
  }

  async crearColegio() {
    try {
      let respuesta: any = await this.api.post('colegios', this.crearColegioForm.value);
      console.log(respuesta);
      this.router.navigate(['/auth/seleccionar-colegio']);
    }
    catch (e) {
      console.log(JSON.stringify(e));
    }
  }

  async cargarTiposColegios() {
    try {
      let respuesta: any = await this.api.get('tipos_colegios');
      this.tiposColegios = respuesta.data;
    }
    catch (e) {
      console.log(JSON.stringify(e));
    }
  }

  setTipo(tipoColegio: any) {
    console.log(tipoColegio);
    this.crearColegioForm.controls['tipos_colegios_id'].setValue(tipoColegio.id);
  }


}
