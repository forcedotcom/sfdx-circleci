public with sharing class NameSpaceUtils {

    public static String getNamespace() {
        String namespace = NameSpaceUtils.class.getName().substringBefore('NameSpaceUtils').substringBefore('.');
        //this gives '' in any development org
        //and gives 'namespace of the org' in the namespaced org
        return namespace ;
    }

    public static String getNamespaceWithPrefix() {
        String namespace = '';
        if(getNamespace() != ''){
             namespace = getNamespace() + '__';
        }
        return namespace ;
    }
}