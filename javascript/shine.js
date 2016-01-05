define (function () {

var theme = {
    // Default Swatches
    color: [
        '# C12e34', '# e6b600', '# 0098d9', '# 2b821d',
        '# 005eaa', '# 339ca8', '# cda819', '# 32a487'
    ],

    // Chart title
    title: {
        textStyle: {
            fontWeight: 'normal'
        }
    },
    
    // range
    dataRange: {
        itemWidth: 15, // range pattern width, the width of the linear gradient horizontal layout for the value * 10
        color: ['# 1790cf', '# a2d4e6']
    },

    // Toolbox
    toolbox: {
        color: ['# 06467c', '# 00613c', '# 872d2f', '# c47630']
    },

    // Prompt box
    tooltip: {
        backgroundColor: 'rgba (0,0,0,0.6)'
    },

    // Area zoom controller
    dataZoom: {
        dataBackgroundColor: '#dedede', // background color data
        fillerColor: 'rgba (154,217,247,0.2)', // fill color
        handleColor: '# 005eaa' // Handle Color
    },
    
    // grid
    grid: {
        borderWidth: 0
    },
    
    // Category axis
    categoryAxis: {
        axisLine: {// coordinate axis
            show: false
        },
        axisTick: {// axis small mark
            show: false
        }
    },

    // Default parameters numerical axes
    valueAxis: {
        axisLine: {// coordinate axis
            show: false
        },
        axisTick: {// axis small mark
            show: false
        },
        splitArea: {// separate area
            show: true, // not displayed by default, property show control display or not
            areaStyle: {// attribute areaStyle (see areaStyle) control region style
                color: ['rgba (250,250,250,0.2)', 'rgba (200,200,200,0.2)']
            }
        }
    },
    
    timeline: {
        lineStyle: {
            color: '# 005eaa'
        },
        controlStyle: {
            normal: {color: '# 005eaa'},
            emphasis: {color: '# 005eaa'}
        }
    },

    // K line graph default parameters
    k: {
        itemStyle: {
            normal: {
                color: '# c12e34', // candle fill color
                color0: '# 2b821d', // Yin fill color
                lineStyle: {
                    width: 1,
                    color: '# c12e34', // candle border color
                    color0: '# 2b821d' // Yin border color
                }
            }
        }
    },
    
    map: {
        itemStyle: {
            normal: {
                areaStyle: {
                    color: '#ddd'
                },
                label: {
                    textStyle: {
                        color: '# c12e34'
                    }
                }
            },
            emphasis: {// is the selected style
                areaStyle: {
                    color: '# e6b600'
                },
                label: {
                    textStyle: {
                        color: '# c12e34'
                    }
                }
            }
        }
    },
    
    force: {
        itemStyle: {
            normal: {
                linkStyle: {
                    color: '# 005eaa'
                }
            }
        }
    },
    
    chord: {
        itemStyle: {
            normal: {
                borderWidth: 1,
                borderColor: 'rgba (128, 128, 128, 0.5)',
                chordStyle: {
                    lineStyle: {
                        color: 'rgba (128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis: {
                borderWidth: 1,
                borderColor: 'rgba (128, 128, 128, 0.5)',
                chordStyle: {
                    lineStyle: {
                        color: 'rgba (128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },
    
    gauge: {
        axisLine: {// coordinate axis
            show: true, // the default display, control display properties show or not
            lineStyle: {// attribute lineStyle control line style
                color: [[0.2, '# 2b821d'], [0.8, '# 005eaa'], [1, '# c12e34']],
                width: 5
            }
        },
        axisTick: {// axis small mark
            splitNumber: 10, // how many segments each split segment
            length: 8, // attribute length Control line length
            lineStyle: {// attribute lineStyle control line style
                color: 'auto'
            }
        },
        axisLabel: {// axis text labels, see axis.axisLabel
            textStyle: {// remaining properties using global default text style, see TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {// separate line
            length: 12, // attribute length Control line length
            lineStyle: {// attribute lineStyle (see lineStyle) control line style
                color: 'auto'
            }
        },
        pointer: {
            length: '90% ',
            width: 3,
            color: 'auto'
        },
        title: {
            textStyle: {// remaining properties using global default text style, see TEXTSTYLE
                color: '# 333'
            }
        },
        detail: {
            textStyle: {// remaining properties using global default text style, see TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: 'Microsoft elegant black, Arial, Verdana, sans-serif'
    }
};

    return theme;
});