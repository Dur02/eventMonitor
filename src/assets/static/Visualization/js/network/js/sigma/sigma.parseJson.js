// Scott Hale (Oxford Internet Institute)
// Requires sigma.js and jquery to be loaded
// based on parseGexf from Mathieu Jacomy @ Sciences Po M�dialab & WebAtlas

sigma.publicPrototype.parseJson = function(data,callback) {
	var sigmaInstance = this;

    for (i=0; i<data.nodes.length; i++){
        var id=data.nodes[i].id;
        data.nodes[i].y=-data.nodes[i].y;
        //window.NODE = data.nodes[i];//In the original, but not sure purpose
        sigmaInstance.addNode(id,data.nodes[i]);
    }

    for(j=0; j<data.edges.length; j++){
        var edgeNode = data.edges[j];

        var source = edgeNode.source;
        var target = edgeNode.target;
        var label = edgeNode.label;
        var eid = edgeNode.id;

        sigmaInstance.addEdge(eid,source,target,edgeNode);
    }

    if (callback) callback.call(this);//Trigger the data ready function
	
	//end jquery getJSON function
};//end sigma.parseJson function
