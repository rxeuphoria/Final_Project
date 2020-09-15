package co.grandcircus.Final_Project.api;

import java.net.URI;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import co.grandcircus.Final_Project.entity.Recipe;
import co.grandcircus.Final_Project.entity.RecipesList;


@Service
public class FinalApi {
private RestTemplate rt;

	
	@Value("${apiKey}")
	private String apiKey;
	
	{
		ClientHttpRequestInterceptor interceptor = (request, body, execution) -> {
			request.getHeaders().add(HttpHeaders.USER_AGENT, "Nutrition");
			return execution.execute(request, body);
		};
		rt = new RestTemplateBuilder().additionalInterceptors(interceptor).build();
	}

  public RecipesList[] showRecipesList(Double minCarbs, Double maxCarbs,Double minProtein,Double maxProtein,
		  								Double minFats, Double maxFats,Integer number) {
	  URI url = UriComponentsBuilder.fromHttpUrl("https://api.spoonacular.com/recipes/findByNutrients")
			  .queryParam("minCarbs", minCarbs)
			  .queryParam("maxCarbs", maxCarbs)
			  .queryParam("minProtein",minProtein)
			  .queryParam("maxProtein",maxProtein)
			  .queryParam("minFats", minFats)
			  .queryParam("maxFats", maxFats)
			  .queryParam("number", number)
			  .queryParam("apiKey", apiKey)
			  .build().toUri();
	  RecipesList[] response=rt.getForObject(url,RecipesList[].class);
		return response;
	}
  
  public Recipe showDetails(Long id) {
	  String url ="https://api.spoonacular.com/recipes/{id}/information?&apiKey={apiKey}";
	  Recipe recipe=rt.getForObject(url, Recipe.class,id,apiKey);
	  return recipe;
	  
  }
  }

