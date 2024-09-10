import { LightningElement, api, wire } from 'lwc';
import getMovieDetails from '@salesforce/apex/Imdcon.getMovieDetails';

export default class MovieDetails extends LightningElement {
    _movieId = '';
    movieDetails = null;
    isLoading = true;

    @api
    get movieId() {
        return this._movieId;
    }

    set movieId(value) {
        if (value) {
            this.isLoading = true;
        }
        this._movieId = value;
    }

    @wire(getMovieDetails, { movieId: '$movieId' })
    wiredGetMovieDetails(result) {
        if (result.data) {
            try {
                const data = JSON.parse(result.data);
                if (data && data.result) {
                    this.movieDetails = data.result;
                } else {
                    this.movieDetails = null; // or handle as needed
                }
            } catch (error) {
                console.error('Error parsing JSON:', error);
                this.movieDetails = null;
            }
        } else if (result.error) {
            console.error('Error occurred while fetching movie details:', result.error);
            this.movieDetails = null;
        }
        this.isLoading = false;
    }

    get showMovieContent() {
        return !this.isLoading && this.movieDetails && this.movieDetails.Poster;
    }
}
