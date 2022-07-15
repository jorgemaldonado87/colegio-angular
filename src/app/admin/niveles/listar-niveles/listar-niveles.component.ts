import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';

@Component({
  selector: 'app-listar-niveles',
  templateUrl: './listar-niveles.component.html',
  styleUrls: ['./listar-niveles.component.scss']
})
export class ListarNivelesComponent implements OnInit {

  niveles:any = [];

  constructor(private api: ApiService) { }

  ngOnInit(): void {
    this.cargarNiveles();
    }

  async cargarNiveles(){
    try{
      let colegio = JSON.parse(localStorage.getItem('colegio')??'{}');
      let niveles :any = await this.api.get('colegios/'+colegio.id+'/niveles');
      this.niveles = niveles.data;
    }catch(e){
      console.log(e);
    }



  }

  editarNivel(nivel:any){
    console.log(nivel);
  }

  eliminarNivel(nivel:any){
    console.log(nivel);
  }

}
