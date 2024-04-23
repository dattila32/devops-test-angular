import { Component, OnInit } from '@angular/core';
import { PersonService } from './service/person.service';
import { Observable } from 'rxjs';
import { Person } from './model/person.model';

@Component({
  selector: 'app-person',
  templateUrl: './person.component.html',
  styleUrls: ['./person.component.scss']
})
export class PersonComponent implements OnInit {

  constructor(private service: PersonService) { }

  persons$: Observable<Person[]> = new Observable<Person[]>();

  ngOnInit(): void {
    this.persons$ = this.service.getPersons();
  }

  

}
