public class Imdcon {
    @AuraEnabled(cacheable=true)
       public static string getMovies(string searchText){
           Http http = new Http();
           HttpRequest request = new HttpRequest();
         request.setEndpoint('https://api.collectapi.com/imdb/imdbSearchByName?query='+searchText);
          //request.setEndpoint('callout:IMDB/imdb/imdbSearchByName?query='+searchText);
           request.setMethod('GET');
           request.setHeader('Authorization', 'apikey 1Rkvk8pzQwwThQFVcTuXv3:0HgstCCnnRrnb60Nap9Fk4');
           HttpResponse response = http.send(request);
           System.debug('Status Code: '+response.getStatusCode());
           System.debug('Body: '+response.getBody());
           if (response.getStatusCode() == 200) {
               return response.getBody();
           }
           else{
               return 'Error Code :'+response.getStatusCode();
           }
           //return response;
           
           
       }
       
       @AuraEnabled(cacheable=true)
       public static string getMovieDetails(string movieId){
           Http http = new Http();
           HttpRequest request = new HttpRequest();
          // request.setEndpoint('callout:IMDB/imdb/imdbSearchById?movieId='+movieId);
          request.setEndpoint('https://api.collectapi.com/imdb/imdbSearchById?movieId='+movieId);
           request.setMethod('GET');
            request.setHeader('Authorization', 'apikey 1Rkvk8pzQwwThQFVcTuXv3:0HgstCCnnRrnb60Nap9Fk4');
           HttpResponse response = http.send(request);
           System.debug('Status Code: '+response.getStatusCode());
           System.debug('Body: '+response.getBody());
           if (response.getStatusCode() == 200) {
               return response.getBody();
           }
           else{
               return 'Error Code :'+response.getStatusCode();
           }
           //return response;
           
           
       }
   }