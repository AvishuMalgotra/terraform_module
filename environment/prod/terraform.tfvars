rg={
    rg1={
        rgname="rgmodule"
        location="Japan east"
    }
}

vnet={
    vnet1={
        vnetname="modulevnet"
        address_space=["10.0.0.0/16"]
        rgname="rgmodule"
        location="Japan east"
    }
}

snet={
    snet1={
        snetname="snet-module"
        rgname="rgmodule"
        vnetname="modulevnet"
        address_prefixes=["10.0.2.0/24"]
    }
}

pip={
    pip1={
        pipname="modulepip"
        rgname="rgmodule"
        location="Japan east"
    }
}

vm={
    vm1={
        nicname="nic-module"
        rgname="rgmodule"
        location="Japan east"
        vmname="modulevm"
        snetname="snet-module"
        vnetname="modulevnet"
        pipname="modulepip"
    }
}