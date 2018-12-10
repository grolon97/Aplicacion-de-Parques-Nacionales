<!-- area protegida select template,
 recibe el listado de especies por parte del area protegida en el create -->
<select id="select">
    <g:each in="${especiesArea}" var="especie">
       <option value="especie.id">${especie.nombreComun}</option>
    </g:each>
  </select>