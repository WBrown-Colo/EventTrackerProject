import { CigarService } from './../../services/cigar.service';
import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Cigar } from '../../models/cigar';

@Component({
  selector: 'app-home',
  imports: [
    CommonModule,
    FormsModule,
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit {

  cigars: Cigar[] = [];

  constructor(
    private cigarService: CigarService,
  ) {}

  ngOnInit(): void {
    this.loadCigars();
  }

  loadCigars(): void {
    this.cigarService.index().subscribe( {
      next: (cigarList) => {
      this.cigars = cigarList;
    },
      error: (someError) => {
        console.error('HomeComponent.loadCigars: error');
        console.error(someError);
      }
    } );
  }

}
