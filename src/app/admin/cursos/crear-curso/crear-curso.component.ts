import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-crear-curso',
  templateUrl: './crear-curso.component.html',
  styleUrls: ['./crear-curso.component.scss']
})
export class CrearCursoComponent implements OnInit {

  niveles: any = [];

  crearCursoForm = new FormGroup({
    nombre: new FormControl(''),
    niveles_id: new FormControl(''),
  });


  constructor(
    private api: ApiService,
    private router: Router
  ) { }


  ngOnInit(): void {
    this.cargarNiveles();
  }


  async cargarNiveles() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio')??'{}');
      let niveles: any = await this.api.get('colegios/' + colegio.id + '/niveles');
      this.niveles = niveles.data;
    } catch (e) {
      console.log(e);
    }
  }

  async crearCurso() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let curso = await this.api.post('colegios/' + colegio.id + '/cursos', this.crearCursoForm.value);
      console.log(curso);
      this.router.navigate(['/admin/cursos']);
    } catch (e) {
      console.log(e);
    }
  }

}
