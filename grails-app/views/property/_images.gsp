<td>
	<div id="message">
		<img alt="img" id="${image[0].toString()}" height="150" width="200" class="avatar" src="${createLinkTo(dir:'images/properties',file:image[0].toString())}"/>
	</div>
	<div id="error"></div>
	<g:if test="${image[1] == 'edit'}" >
		<div>
			<g:remoteLink action="deleteImage"
              update="[success:'message',failure:'error']"
			  params="[imageId:image[0], id:image[2]]">Delete
					<img alt="img" id="delete" class="avatar" src="${createLinkTo(dir:'images',file:'delete.gif')}"/>
				</g:remoteLink>


		</div>
	</g:if>
</td>