import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-listar-periodos',
  templateUrl: './listar-periodos.component.html',
  styleUrls: ['./listar-periodos.component.scss']
})
export class ListarPeriodosComponent implements OnInit {


  periodos: any = [];

  constructor( private api: ApiService, private router: Router) { }

  ngOnInit(): void {
    this.cargarPeriodos();
  }

  async cargarPeriodos() {
    try {
      let colegio = JSON.parse(localStorage.getItem('colegio') ?? '{}');
      let periodos: any = await this.api.get('colegios/' + colegio.id + '/periodos');
      this.periodos = periodos.data;
    } catch (e) {
      console.log(e);
    }
  }

  editarPeriodo(periodo: any) {
    this.router.navigate(['/admin/periodos/editar-periodo', periodo.id]);
  }

  async eliminarPeriodo(periodo: any) {
  }



}
