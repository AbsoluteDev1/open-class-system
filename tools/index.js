const fs = require('fs');
const chmodr = require('chmodr');
const projectPath = "./../ats";
const distPath = "./../dist";
function *walkSync(dir) {
    const files = fs.readdirSync(dir, { withFileTypes: true });
    for (const file of files) {
        if (file.isDirectory()) {
            yield* walkSync(path.join(dir, file.name));
        } else {
            yield path.join(dir, file.name);
        }
    }
}

const FILENAME = "nextgen";

class Builder{
    constructor() {
        RegisterCommand("qx-build",(source , args)=>{
            console.log("Debut du build")
            this.createDevBuild();
        });
    }

    createDevBuild(){
        const root = GetResourcePath(GetCurrentResourceName()).split("resources")[0] + "resources";
        const filesPathServer = [root+"/"+FILENAME+"/src/shared/Config.lua"];
        const filesPathClient = [root+"/"+FILENAME+"/src/shared/Config.lua"];

        for (const filePath of walkSync(root+"/"+FILENAME+"/src/shared/core")) {
            if(!filePath.includes('.git') && !filePath.includes('.idea\\') && !filePath.includes('__dev__') && (filePath.endsWith(".lua"))
                && filePath.endsWith("fZAxmanifest.lua") == false){
                console.log(filePath);
                filesPathServer.push(filePath);
                filesPathClient.push(filePath);
            }
        }

        for (const filePath of walkSync(root+"/"+FILENAME+"/src/shared/locales")) {
            if(!filePath.includes('.git') && !filePath.includes('.idea\\')&& !filePath.includes('__dev__') && filePath.endsWith(".lua") && filePath.endsWith("fZAxmanifest.lua") == false){
                console.log(filePath);
                filesPathServer.push(filePath);
                filesPathClient.push(filePath);
            }
        }

        for (const filePath of walkSync(root+"/"+FILENAME+"/src/shared/class")) {
            if(!filePath.includes('.git') && !filePath.includes('.idea\\') && !filePath.includes('__dev__') && filePath.endsWith(".lua") && filePath.endsWith("fZAxmanifest.lua") == false){
                console.log(filePath);
                filesPathServer.push(filePath);
                filesPathClient.push(filePath);
            }
        }

        filesPathServer.push(root+"/"+FILENAME+"/src/server/Config.lua");

        for (const filePath of walkSync(root+"/"+FILENAME+"/src/server/class")) {
            if(!filePath.includes('.git') && !filePath.includes('.idea\\') && !filePath.includes('__dev__') && filePath.endsWith(".lua") && filePath.endsWith("fZAxmanifest.lua") == false){
                console.log(filePath);
                filesPathServer.push(filePath);
            }
        }



        for (const filePath of walkSync(root+"/"+FILENAME+"/src/client/class")) {
            if(!filePath.includes('.git') && !filePath.includes('.idea\\') && !filePath.includes('__dev__') && filePath.endsWith(".lua") && filePath.endsWith("fZAxmanifest.lua") == false){
                console.log(filePath);
                filesPathClient.push(filePath);
            }
        }

        this.createBuild(filesPathServer, root,"server");

        this.createBuild(filesPathClient, root,"client");
    }

    createBuild(filesPathServer, root,fileName) {
        let buildServer = "";
        for (const filePath of filesPathServer) {
            let data = fs.readFileSync(filePath, 'utf8');
            data = "--- " + filePath + "\r\n"+data;
            buildServer += data+"\r\n";
        }

        if (fs.existsSync(root + "/"+FILENAME+"/_dist/"+fileName+".lua")) {
            //file exists
            fs.unlinkSync(root + "/"+FILENAME+"/_dist/"+fileName+".lua");
        }
        fs.writeFileSync(root + "/"+FILENAME+"/_dist/"+fileName+".lua", buildServer, {flag: 'wx'}, function (err) {
            if (err) throw err;
            console.log("Build _dist/"+fileName+".lua");
        });

    }

}

/**
 * Look ma, it's cp -R.
 * @param {string} src  The path to the thing to copy.
 * @param {string} dest The path to the new copy.
 */
function copyRecursiveSync(src, dest) {
    var exists = fs.existsSync(src);
    var stats = exists && fs.statSync(src);
    var isDirectory = exists && stats.isDirectory();
    if (isDirectory) {
        fs.mkdirSync(dest);
        fs.readdirSync(src).forEach(function(childItemName) {
            copyRecursiveSync(path.join(src, childItemName),
                path.join(dest, childItemName));
        });
    } else {
        fs.copyFileSync(src, dest);
    }
};

new Builder();