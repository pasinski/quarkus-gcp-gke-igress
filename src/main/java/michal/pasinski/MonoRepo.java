package michal.pasinski;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class MonoRepo implements PanacheRepositoryBase<MonoEntity, Long> {
}
