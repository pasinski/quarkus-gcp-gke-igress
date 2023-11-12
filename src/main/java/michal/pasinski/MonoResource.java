package michal.pasinski;

import jakarta.inject.Inject;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("/mono")
public class MonoResource {

    @Inject
    MonoRepo monoRepo;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<MonoEntity> hello() {
        return monoRepo.listAll();
    }
}
