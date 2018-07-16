#import "GameViewController.h"
#import "Renderer.h"

@implementation GameViewController
{
    MTKView *_view;
    Renderer *_renderer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _view = (MTKView *)self.view;
    _view.layer.contentsScale = [[NSScreen mainScreen] backingScaleFactor];
    _view.device = MTLCreateSystemDefaultDevice();

    if (_view.device == nil)
    {
        NSLog(@"Metal is not supported on this device");
        self.view = [[NSView alloc] initWithFrame:self.view.frame];
        return;
    }

    _renderer = [[Renderer alloc] initWithMetalKitView:_view];
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    _view.delegate = _renderer;
}

- (IBAction)saveCurrentImage:(id)sender
{
    [_renderer saveCurrentImage];
}

@end
