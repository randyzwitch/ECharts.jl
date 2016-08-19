function Base.call{T<:AbstractEChartType}(::Type{T}; kwargs...)
    out = T()
    for (sym, val) in kwargs
        setfield!(out, sym, val)
    end
    out
end

function LineStyle()
    LineStyle("#333",1,"solid",1,nothing,0,0,nothing)
end
function AreaStyle()
    AreaStyle(String["rgba(250,250,250,0.3)","rgba(200,200,200,0.3)"],nothing,nothing,0,0,nothing)
end
function TextStyle()
    TextStyle("#000","normal","normal","sans-serif",12)
end
function SplitArea()
    SplitArea("auto",true,nothing)
end
function SplitLine()
    SplitLine(true,"auto",nothing)
end
function AxisLabel()
    AxisLabel(true,"auto",false,0,8,nothing,nothing)
end
function AxisLine()
    AxisLine(true,true,LineStyle("#333",1,"solid",1,nothing,0,0,nothing))
end
function AxisTick()
    AxisTick(true,"auto",false,5,LineStyle("#333",1,"solid",1,nothing,0,0,nothing))
end
function LabelOpts()
    LabelOpts(false,nothing)
end
function Label()
    Label(nothing,nothing)
end
function ItemStyleOpts()
    ItemStyleOpts("adaptive","#000",0,nothing,nothing,0,0,nothing)
end
function ItemStyle()
    ItemStyle(nothing,nothing)
end
function IconStyleOpts()
    IconStyleOpts("adaptive","#666",1,1,nothing,nothing,0,0,nothing)
end
function IconStyle()
    IconStyle(nothing,nothing)
end
function CrossStyle()
    CrossStyle("#555",1,"dashed",nothing,nothing,0,0,0,nothing)
end
function ShadowStyle()
    ShadowStyle("rgba(150,150,150,0.5)",nothing,nothing,0,0,0)
end
function AxisPointer()
    AxisPointer("line","auto","auto",2000,1000,1000,300,"cubicOut",0,nothing,nothing,nothing)
end
function Tooltip()
    Tooltip(true,true,"item","mousemove",false,0,100,true,nothing,0.4,nothing,"rgba(50,50,50,0.7)","#333",0,5,"#fff",nothing,nothing)
end
function Legend()
    Legend(true,0,2,"auto","auto","auto","auto","auto","auto","horizontal","auto",5,10,25,14,nothing,true,nothing,nothing,nothing,"transparent","#ccc",1,nothing,nothing,0,0)
end
function Toolbox()
    Toolbox(false,"vertical",10,15,Dict{Any,Any}(),true,0,2,nothing,nothing,"center","auto",nothing,"auto","auto")
end
function Axis()
    Axis(0,nothing,nothing,nothing,"start",nothing,15,false,nothing,nothing,nothing,false,5,0,nothing,true,nothing,nothing,nothing,nothing,nothing,nothing)
end
function Title()
    Title(true,nothing,nothing,"blank",nothing,nothing,nothing,"blank",nothing,5,5,0,2,"left","auto","auto","auto","transparent","transparent",1,nothing,nothing,0,0)
end
function Grid()
    Grid(false,0,2,"auto",60,"10%",60,"auto","auto",false,"transparent","#ccc",1,nothing,nothing,0,0)
end
function DataZoom()
    DataZoom(nothing,60,80)
end
function Timeline()
    Timeline(true,"slider","time",0,false,false,true,2000,true,"left",0,2,"auto","auto","auto","auto",5,"horizontal",false,"emptyCircle",10,nothing,[0,0],nothing,nothing,nothing,nothing,nothing,nothing)
end
function Polar()
    Polar(0,2,String["50%","50%"],nothing)
end
function RadiusAxis()
    RadiusAxis(0,"value",nothing,"start",nothing,15,false,nothing,"auto","auto",false,5,0,nothing,true,nothing,nothing,nothing,nothing,nothing,nothing)
end
function AngleAxis()
    AngleAxis(0,0,true,"category",nothing,"auto","auto",false,5,0,nothing,true,nothing,nothing,nothing,nothing,nothing,nothing)
end
function Radar()
    Radar(0,2,String["50%","50%"],"75%",90,nothing,15,true,nothing,nothing,nothing,nothing,nothing,nothing)
end
function VisualMap()
    VisualMap(nothing)
end
function ScaleLimit()
    ScaleLimit(nothing,nothing)
end
function Geo()
    Geo(true,nothing,false,nothing,1,nothing,nothing,false,nothing,nothing,0,2,"auto","auto","auto","auto",nothing,false)
end
function Parallel()
    Parallel(0,2,"auto",60,80,60,"auto","auto","horizontal",nothing)
end
function AreaSelectStyle()
    AreaSelectStyle(20,1,"rgba(160,197,232)","rgba(160,197,232)",0.3)
end
function ParallelAxis()
    ParallelAxis(nothing,0,nothing,"value",nothing,"start","#fff",15,false,nothing,"auto","auto",false,5,0,nothing,true,nothing,nothing,nothing,nothing)
end
function Series()
    Series(nothing,nothing,nothing,nothing,false,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,"0%","100%",nothing,nothing,nothing,nothing,nothing)
end
function EChart()
    EChart(Title(true,nothing,nothing,"blank",nothing,nothing,nothing,"blank",nothing,5,5,0,2,"left","auto","auto","auto","transparent","transparent",1,nothing,nothing,0,0),nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,Toolbox(false,"vertical",10,15,Dict{Any,Any}(),true,0,2,nothing,nothing,"center","auto",nothing,"auto","auto"),nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing)
end
