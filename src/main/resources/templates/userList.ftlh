<#import "parts/common.ftlh" as c>

<@c.page>
List of users
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Role</th>
            <th>Edit</th>
        </tr>
        </thead>
        <tbody>
    <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">Редактировать</a></td>
            </tr>
    </#list>
        </tbody>
    </table>
    <p><a href="/main">В список сообщений</a></p>
</@c.page>