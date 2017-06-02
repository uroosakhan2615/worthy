package UserService;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.User;

import com.worthy.dao.UserDAO;
import com.worthy.dao.UserDAOImpl;
import com.worthy.entity.Roles;
import com.worthy.entity.UserRoles;

public class UserService implements UserDetailsService {
	
	private UserDAO userDAO = new UserDAOImpl();
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		com.worthy.entity.User user = userDAO.findByUserName(username);

		List<GrantedAuthority> authorities = buildUserAuthority(userDAO.getUserRolesByName(user.getEmail()));
		return buildUserForAuthentication(user, authorities);
	}
	
	private User buildUserForAuthentication(com.worthy.entity.User user,
			List<GrantedAuthority> authorities) {
		return new User(user.getEmail(), user.getPassword(), true, true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(List<UserRoles> userRoles) {
		List<GrantedAuthority> setAuths = new ArrayList<GrantedAuthority>();
		// Build user's authorities
		for (UserRoles userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRoles().getRoleName()));
		}
		
		return setAuths;
		
		//List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
		//return Result;
	}
//	
//	User user = null;
//    try {
//        user = dao.findUser(username);
//        if (user == null) {
//            throw new UsernameNotFoundException("user not found");
//        }
//    } catch (Exception e) {
//        throw new EntityNotFoundException(e.getCause().getMessage());
//    }
//    String uname = user.getUserName();
//    String password = user.getPassword();
//    boolean enabled = true;
//    boolean accountNonExpired = Boolean.TRUE;
//    boolean credentialsNonExpired = Boolean.TRUE;
//    boolean accountNonLocked = Boolean.TRUE;
//    Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//    for (Iterator it = user.getRoles().iterator(); it.hasNext();) {
//        Roles role = (Roles) it.next();
//        authorities.add(new SimpleGrantedAuthority(role.getName()));
//    }
//    return new org.springframework.security.core.userdetails.User(
//            uname, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
//}
	
}
