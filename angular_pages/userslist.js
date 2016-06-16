<div ng-controller="usersController">  
 
            <table class="table table-bordered table-hover">
                <thead class="table-color">
                    <tr>
                        
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email Id</th>
                        <th>City</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="item in registrations">
                        <td>{{item.firstname}}</td>
                        <td>{{item.lastname}}</td>
                        <td>{{item.emailid}}</td>
                         <td>{{item.City}}</td>
                        <td>{{item.phone}}</td>
                         <td>{{item.address}}</td>
                         <td><a href="#/edit/{{item.user_id}}"><span class="glyphicon glyphicon-pencil"></span></a></td>
                         <td><span class="glyphicon glyphicon-trash"></span></td>
                     </tr>
                </tbody>
            </table>
             </div>