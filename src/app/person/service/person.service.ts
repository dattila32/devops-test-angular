import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Person } from '../model/person.model';

@Injectable({
  providedIn: 'root'
})
export class PersonService {

  constructor(private http: HttpClient) { }

  public getPersons(): Observable<Person[]> {
    return this.http.get<Person[]>("/api/persons");
  }


}
