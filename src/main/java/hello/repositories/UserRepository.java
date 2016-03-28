package hello.repositories;

import hello.models.User;
import java.util.List;


public interface UserRepository {

    public void create(User user);

    /**
     * Note that for now this will load all rows into memory and return.
     * This obviously will not work out if your data set is extremely large.
     * Need to implement a streaming version of this to work with large
     * data sets.
     * @return List<User>
     */
    public List<User> getAll();
}
