import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, throwError } from 'rxjs';
import { Cigar } from '../models/cigar';
import { DatePipe } from '@angular/common';

@Injectable({
  providedIn: 'root'
})
export class CigarService {

  private url = environment.baseUrl + 'api/cigars';

  constructor(
    private http: HttpClient, private datePipe: DatePipe
  ) { }

  public index() : Observable<Cigar[]> {
    return this.http.get<Cigar[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('CigarService.index(): error retrieving cigar: ' + err)
        );
      })
    );
  }

  public create(cigar: Cigar) : Observable<Cigar> {
    return this.http.post<Cigar>(this.url, cigar).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('CigarService.create(): error creating cigar: ' + err)
        );
      })
    );
  }

  public update(cigar: Cigar) : Observable<Cigar> {
    if(cigar.completed) {
      cigar.lastUpdate = this.datePipe.transform(Date.now(), 'shortDate');
    } else {
      cigar.lastUpdate = null;
    }

    return this.http.put<Cigar>(this.url + "/" + cigar.id, cigar).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('CigarService.update(): error updating cigar: ' + err)
        );
      })
    );
  }

  public destroy(id: number) : Observable<void> {
    return this.http.delete<void>(this.url + "/" + id).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () => new Error('CigarService.delete(): error deleting cigar: ' + err)
        );
      })
    );
  }

}
