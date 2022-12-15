#ifndef IGRAPHVIZ_H_1356546879314
#define IGRAPHVIZ_H_1356546879314

#include <QSharedPointer>
#include <QPointF>

class IGVEdge
{
public:
    typedef QVector<QPoint>     TCPList;    //!< control points list

    virtual ~IGVEdge() {}

    virtual QString getHeadName() const = 0;
    virtual QString getTailName() const = 0;

    virtual QString getLabel() const = 0;
    virtual QPoint  getLabelPos() const = 0;

    virtual QSharedPointer<IGVEdge> getNextOutEdge() const = 0;

    virtual TCPList getControlPoints() const = 0;
};

class IGVNode
{
public:
    virtual ~IGVNode() {}

    virtual QString getName() const = 0;
    virtual QPoint getPos() const = 0;

    virtual QSharedPointer<IGVNode> getPrevNode() const = 0;
    virtual QSharedPointer<IGVNode> getNextNode() const = 0;

    virtual QSharedPointer<IGVEdge> getFirstOutEdge() const = 0;
};

class IGVGraph
{
public:
    virtual ~IGVGraph() {}

    virtual bool    addNode(const QString &name) = 0;
    virtual int     getNodeCount() const = 0;
    virtual QSharedPointer<IGVNode> getNode(const QString &name) const = 0;
    virtual QSharedPointer<IGVNode> getFirstNode() const = 0;
    virtual QSharedPointer<IGVNode> getLastNode() const = 0;

    virtual bool    addEdge(const QString &s1, const QString &s2, const QString &l) = 0;
    virtual int     getEdgeCount() const = 0;

    virtual void    layoutGraphUsingDot() = 0;
    virtual void    renderToFile(const QString &fileName) = 0;
};


/*!
 * GraphViz library wrapper's interface.
 * Supports to create IGVGraph for work with GraphViz libraries.
 */
class IGraphViz
{
public:
    virtual ~IGraphViz() {}

    //! Returns version of AutomataEditor for which plugin is implemented, tested ...
    virtual QString getVersion() const = 0;

    //! Returns used GraphViz version string
    virtual QString getGraphVizVersion() const = 0;

    //! Returns instance of new graph
    //! \sa IGVGraph, IGVNode and IGVEdge
    virtual QSharedPointer<IGVGraph> createGraph() const = 0;
};

Q_DECLARE_INTERFACE(IGraphViz, "AutomataEditor/IGraphViz/2.0");

#endif //IGRAPHVIZ_H_1356546879314
