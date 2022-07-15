//servicio para harle llamadas a la api
//injectable
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})

export class ApiService {
  constructor(private http: HttpClient) { }

  //metodo que retorna un header con el token
  private getHeader() {
    return new HttpHeaders({
      'Authorization': 'Bearer ' + localStorage.getItem('token')
    });
  }

  //metodo para hacer peticiones get
  //recibe la url y los parametros
  get(url: string, params?: any) {
    return this.http.get(this.getBaseUrl()+url, { headers: this.getHeader(), params }).toPromise();
  }

  //metodo para hacer peticiones post
  //recibe la url y los datos
  post(url: string, data?: any) {
    return this.http.post(this.getBaseUrl()+url, data, { headers: this.getHeader() }).toPromise();
  }

  getBaseUrl() {
    return environment.apiUrl;
  }


}
