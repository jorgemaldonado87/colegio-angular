import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-crear-periodo',
  templateUrl: './crear-periodo.component.html',
  styleUrls: ['./crear-periodo.component.scss']
})
export class CrearPeriodoComponent implements OnInit {

  crearPeriodoForm = new FormGroup({
    nombre: new FormControl(''),
    fecha_inicio: new FormControl(''),
    fecha_fin: new FormControl(''),
    agno: new FormControl(''),
  });


  constructor(private api: ApiService,private router: Router) { }

  ngOnInit(): void {
  }

  async crearPeriodo() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let periodo = await this.api.post('colegios/' + colegio.id + '/periodos', this.crearPeriodoForm.value);
      console.log(periodo);
      this.router.navigate(['/admin/periodos']);
    }
    catch (e) {
      console.log(e);
    }
  }


}
